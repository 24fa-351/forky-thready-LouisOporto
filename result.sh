rm result.txt
echo "Running forky.exe testing three patterns"
echo "Pattern 1 (5 times)"
echo

echo "Pattern 1" >> result.txt
for i in {1..5}
do
    echo
    echo "Pattern 1 - $i" >> result.txt
    echo
    random_number=$(( (RANDOM % 10) + 1 ))
    echo "$(./forky.exe $random_number 1)" >> result.txt
    wait
done

echo "Pattern 2 (5 times)"
echo
echo "Pattern 2" >> result.txt
for i in {1..5}
do
    echo
    echo "Pattern 2 - $i" >> result.txt
    echo
    random_number=$(( (RANDOM % 10) + 1 ))
    echo "$(./forky.exe $random_number 2)" >> result.txt
    wait
done

echo "Pattern 3 (5 times)"
echo
echo "Pattern 3" >> result.txt
for i in {1..5}
do
    echo
    echo "Pattern 3 - $i" >> result.txt
    echo
    random_number=$(( (RANDOM % 10) + 1 ))
    echo "$(./forky.exe $random_number 3)" >> result.txt
    wait
done

echo "Finished results...exiting"




