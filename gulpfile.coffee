gulp = require("gulp")
webpack = require("webpack")

gulp.task "webpack", (cb)->
    config = require("./webpack.config.js")
    webpack config,(err,stats)->
        if err then throw(new require("gulp-util").PluginError("webpack",err))
        callback()

gulp.task "build", (cb)->
    uglify = require("gulp-uglify")
    rename = require("gulp-rename")
    sourcemaps = require("gulp-sourcemaps")
    return gulp.src(["./dist/*.js","!**/*.min.js"])
        .pipe(sourcemaps.init())
        .pipe(uglify())
        .pipe(rename({extname:".min.js"}))
        .pipe(sourcemaps.write("./"))
        .pipe(gulp.dest("./dist/"))

gulp.task "default", ["build"]
