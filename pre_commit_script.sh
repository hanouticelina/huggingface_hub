curl -o main_Makefile https://raw.githubusercontent.com/huggingface/huggingface_hub/main/Makefile
curl -o main_setup.py https://raw.githubusercontent.com/huggingface/huggingface_hub/main/setup.py

diff_failed=0
if ! diff -q main_Makefile Makefile; then
  echo "Error: The Makefile has changed. Please ensure it matches the main branch."
  diff_failed=1
fi
if ! diff -q main_setup.py setup.py; then
  echo "Error: The setup.py has changed. Please ensure it matches the main branch."
  diff_failed=1
fi
if [ $diff_failed -eq 1 ]; then
  echo "❌ Error happened as we detected changes in the files that should not be changed ❌"
  exit 1
fi
echo "No changes in the files. Proceeding..."
rm -rf main_Makefile main_setup.py

