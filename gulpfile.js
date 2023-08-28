const { series, src, dest } = require("gulp");
const rimraf = require("rimraf");
const jsonEditor = require("gulp-json-editor");
const rename = require("gulp-rename");
const argv = require("yargs").argv;

const server = argv.server || "dev";

const scripts = {
  start: "pm2 start ecosystem.config.js --env production",
  stop: "pm2 stop all",
  delete: "pm2 delete all",
  reload: "pm2 reload ecosystem.config.js",
};

const paths = {
  dist: "dist",
  root: "src",
  protractor: [],
};

function cleanDist(cb) {
  return rimraf(paths.dist, cb);
}

function copyFiles() {
  return src([".env", "pm2-startup.sh", "pm2-script.sh"]).pipe(
    dest(paths.dist)
  );
}

function copyEcosystemFiles() {
  const files = [];
  switch (server) {
    case "live":
      files.push("ecosystem.config.live.js");
      break;
    case "stage":
      files.push("ecosystem.config.stage.js");
      break;
    default:
      files.push("ecosystem.config.js");
      break;
  }
  return src(files).pipe(rename("ecosystem.config.js")).pipe(dest(paths.dist));
}

function copyPackage() {
  return src("package.json")
    .pipe(
      jsonEditor((json) => {
        json.scripts = scripts;
        delete json.devDependencies;
        return json;
      })
    )
    .pipe(dest(paths.dist));
}

function copyPublic() {
  return src(`./${paths.root}/public/**/*`).pipe(
    dest(`${paths.dist}/${paths.root}/public`)
  );
}

exports.default = series(
  cleanDist,
  copyFiles,
  copyEcosystemFiles,
  copyPackage,
  copyPublic
);
