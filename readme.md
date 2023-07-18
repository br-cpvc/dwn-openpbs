# instructions

```bash
cd deps/pkg-openpbs/
git checkout master
git pull
./scripts/builddeb.sh
cd ../..
git rm -r packages
cp -a deps/pkg-openpbs/deps/openpbs/ci/packages .
git add packages deps/pkg-openpbs
git commit -m "ADD DESCRIPTION"
git push
```

