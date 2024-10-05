rm results.txt
echo "Running forky.exe testing three patterns"

echo "Run this program by calling: make test" >> results.txt

echo "Pattern 1 (5 times)"
echo

echo "Pattern 1" >> results.txt

for i in {1..5}
do
    echo >> results.txt
    echo "Pattern 1 - $i" >> results.txt
    echo >> results.txt
    random_number=$(( (RANDOM % 256) + 1 ))
    echo "$(./forky.exe $random_number 1)" >> results.txt
    wait
done

echo "Pattern 2 (5 times)"
echo >> results.txt
echo "Pattern 2" >> results.txt

for i in {1..5}
do
  echo >> results.txt
  echo "Pattern 2 - $i" >> results.txt
  echo >> results.txt
  random_number=$(( (RANDOM % 256) + 1 ))
  echo "$(./forky.exe $random_number 2)" >> results.txt
  wait
done

# echo "Pattern 3 (5 times)"
# echo >> result.txt
# echo "Pattern 3" >> result.txt

# for i in {1..5}
# do
#     echo >> results.txt
#     echo "Pattern 3 - $i" >> results.txt
#     echo >> results.txt
#     random_number=$(( (RANDOM % 256) + 1 ))
#     echo "$(./forky.exe $random_number 3)" >> results.txt
# done

echo
echo "Finished results...exiting"




