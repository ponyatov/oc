type token = Char | Digit

let toString token = match token with Char -> "char:" | Digit -> "digit:"
