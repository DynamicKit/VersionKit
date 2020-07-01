

if [ $1 = "settings" ]
then
    xcodebuild -showBuildSettings
elif [ $1 = "git" ]
then
    git add .
    git commit -m "$2"
    git push -u origin HEAD
else
    echo "invalid arguemnt"
fi
