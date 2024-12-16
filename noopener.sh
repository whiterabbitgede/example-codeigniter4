

mv app/Config/Boot/development.php app/Config/Boot/development.php-bak
mv app/Config/Boot/testing.php app/Config/Boot/testing.php-bak
sed -i 's/error_reporting/\/\/error_reporting/g' app/Config/Boot/production.php

#grep -rni app/Views/ -e 'target="_blank"'
grep -rli app/Views/ -e 'target="_blank"' | xargs sed -i  's/target="_blank"/target="_blank" rel="noopener"/g'
