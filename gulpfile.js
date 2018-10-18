// Snappy Food

// Imports
const gulp =          require('gulp');
const htmlHint =      require('gulp-htmlhint');
const htmlValidator = require('gulp-w3c-html-validator');
const size =          require('gulp-size');

// Setup
const htmlHintConfig = { 'attr-value-double-quotes': false };

// Tasks
function validateHtml() {
   return gulp.src('websites/**/*.html')
      .pipe(size({ showFiles: true }))
      .pipe(htmlHint(htmlHintConfig))
      .pipe(htmlHint.reporter())
      .pipe(htmlValidator())
      .pipe(htmlValidator.reporter());
   }

// Gulp
gulp.task('validate-html', validateHtml);
