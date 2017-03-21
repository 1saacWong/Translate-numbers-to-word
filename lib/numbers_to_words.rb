require 'pry'

# I tried to separate long numbers into parts of 3, e.g: |10|987|654|321|


class String
  $result = []
  $ten = false
  $oneDigit = {
    '9' => "Nine", '8' => "Eight", '7'=> "Seven",
    '6' => "Six", '5' => "Five", '4' => "Four",
    '3' => "Three",'2' => "Two", '1' => "One"
  }

  $tenDigit = {
    '9' => "Ninety", '8' => "Eighty", '7' => "Seventy",
    '6' => "Sixty", '5' => "Fifty", '4' => "Forty",
    '3' => "Thirty", '2' => "Twenty"
  }

  $tenToNineteen = {
    '9'=>"Nineteen", '8'=>"Eighteen", '7'=>"Seventeen",
    '6'=>"Sixteen", '5'=>"Fifteen", '4'=>"Fourteen",
    '3'=>"Thirteen", '2'=>"Twelve", '1' => "Eleven",
    '0' => "Ten"
  }

  $zeroZeroZero = {
    0 => '', 1 => 'Thousand', 2 => 'Million', 3 => 'Billion', 4 => 'Trillion',
    5 => 'Quadrillion', 6 => 'Quintillion', 7 => 'Sextillion', 8 => 'Septillion',
    9 => 'Octillion', 10 => 'Nonillion'
  }

  define_method(:numbers_to_words) do
    $result = []
    reversedNum = self.reverse()
    everyThreeDigits = reversedNum.scan(/.{1,3}/)
    length = everyThreeDigits.length - 1
    everyThreeDigits.length.times() do |i|
      tempNum = length-i
      thatNum = everyThreeDigits.at(tempNum)
      normalNum = thatNum.reverse()
      numbers = normalNum.split("")
      $zeroZeroZero.each do |zZZ, name|
        if tempNum == zZZ
          checkLength(numbers)
          $result.push(' '+ name)
        end
      end
    end
    $result.join()
  end

  def checkLength(numbers)
    if numbers.length == 3
      hundred(numbers.at(0))
      ty(numbers.at(1))
      singleDigit(numbers.at(2))
    elsif numbers.length == 2
      ty(numbers.at(0))
      singleDigit(numbers.at(1))
    elsif numbers.length == 1
      singleDigit(numbers.at(0))
    end
  end

  def hundred(number)
    $oneDigit.each do |num, name|
      if number == num
        $result.push(' '+name + ' hundred')
      end
    end
  end

  def ty(number)
    if number == '0'
      $result.push(' ')
    elsif number == '1'
      $ten = true
    else
      $tenDigit.each do |num, name|
        if number == num
          $result.push(' '+name)
        end
      end
    end
  end

  def singleDigit(number)
    if $ten
      $tenToNineteen.each do |num, name|
        if number == num
          $result.push(' '+name)
          $ten = false
        end
      end
    else
      $oneDigit.each do |num, name|
        if number == num
          $result.push(' '+name)
        end
      end
    end
  end

end
