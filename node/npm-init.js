// MODIFIED from: https://nodesource.com/

let cp = require('child_process');
let fs = require('fs');
let path = require('path');

const USER = process.env.GITHUB_USERNAME || 'YOUR_GITHUB_USERNAME';

let defaults = {
  name: basename || package.name,
  version: '0.0.1',
  description: '',
  main: 'index.js',
  private: true,
  license: 'MIT'
};

defaults.name = prompt('name', defaults.name, (n) => {
  defaults.repository = {
    type: 'git',
    url: `git://github.com/${USER}/${n}.git`
  }
  defaults.bugs = { url: `https://github.com/${USER}/${n}/issues` };
  defaults.homepage = `https://github.com/${USER}/${n}`;

  return n;
});

defaults.description = prompt('description', defaults.description);

defaults.main = prompt('entry point', defaults.main, (m) => {
  let n = defaults.name;
  // CREATE main file, .gitignore, and README.md
  let cwd = process.cwd();
  fs.writeFileSync(path.join(cwd, m), "");
  fs.writeFileSync(path.join(cwd, '.gitignore'), "node_modules");
  fs.writeFileSync(path.join(cwd, 'README.md'), `# ${n}`);
});

defaults.create = prompt('create github repo', 'yes', (val) => {
  val = val.indexOf('y') !== -1 ? true : false;
  let n = defaults.name;

  if (val) {
    let PW = cp.execSync(`security 2>&1 >/dev/null find-generic-password -ga npm-init \
      |ruby -e 'print $1 if STDIN.gets =~ /^password: "(.*)"$/'`).toString('utf-8');
    let curl = `curl -u ${USER}:${PW} https://api.github.com/user/repos -d '{ "name": "${n}", "private": "true" }' `;
    let remote = `git remote add origin https://github.com/${USER}/${n}.git`;
    cp.execSync(curl);
    cp.execSync('git init');
    cp.execSync(remote);
  }

  return undefined;
});

defaults.keywords = prompt((s) => { return s.split(/\s+/) });
defaults.cleanup = (cb) => { cb(null, undefined) };

module.exports = defaults;
