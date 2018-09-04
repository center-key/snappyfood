// Snappy Food

// Imports
const gulp =             require('gulp');
const htmlHint =         require('gulp-htmlhint');
const size =             require('gulp-size');
const w3cHtmlValidator = require('gulp-w3cjs');

// Setup
const htmlHintConfig = { 'attr-value-double-quotes': false };

// Tasks
function validateHtml() {
   return gulp.src('websites/**/*.html')
      .pipe(size({ showFiles: true }))
      .pipe(w3cHtmlValidator())
      .pipe(w3cHtmlValidator.reporter())
      .pipe(htmlHint(htmlHintConfig))
      .pipe(htmlHint.reporter());
   }

// Gulp
gulp.task('validate-html', validateHtml);
