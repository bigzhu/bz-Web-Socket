#! /bin/bash
sh ./change_name.sh
npm run build
git commit -am $1
npm version patch
npm publish ./
git push
