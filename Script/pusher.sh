

if [ $1 = "jazzy" ]
then
jazzy \
  --clean \
  --author Mohammadreza Koohkan \
  --author_url https://mohamadreza.codes \
  --output public
elif [ $1 = "git" ]
then
echo "Please define commit message "
read commit
git add .
git commit -m "$commit"
git push -u origin head
else
    echo "invalid arguemnt"
fi
