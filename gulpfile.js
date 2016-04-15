'use strict';

// Requires
var gulp         = require('gulp'),
    plumber      = require('gulp-plumber'),
    sass         = require('gulp-sass'),
    uglify       = require('gulp-uglify'),
    autoprefixer = require('gulp-autoprefixer');

// Paths
var source      = './sass/**/*.scss',
    destination = './assets/static',
    jssource    = './js/**/*.js';

// Autoprefixer config
var autoprefixerOptions = {
  browsers: ['last 2 versions']
};

// Error handler with plumber
var onError = function(err) {
  console.log(err);
  this.emit('end');
};

// JavaScript
gulp.task('js', function () {
  return gulp.src(jssource)
    .pipe(uglify())
    .pipe(gulp.dest(destination + '/js'));
});

// Sass
gulp.task('sass', function () {
  return gulp.src(source)
    .pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))
    .pipe(gulp.dest(destination));
});

// CSS
gulp.task('css', ['sass'], function () {
  return gulp.src(destination + '/**/*.css')
    .pipe(plumber({errorHandler: onError}))
    .pipe(autoprefixer(autoprefixerOptions))
    .pipe(gulp.dest(destination));
});

// Watch: build
gulp.task('watch', function () {
  gulp.watch(source, ['css', 'js']);
});
