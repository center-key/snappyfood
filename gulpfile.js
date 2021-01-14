// Snappy Food

// Imports
import gulp from          'gulp';
import htmlHint from      'gulp-htmlhint';
import htmlValidator from 'gulp-w3c-html-validator';
import size from          'gulp-size';

// Setup
const htmlHintConfig = { 'attr-value-double-quotes': false };

// Tasks
const validateHtml = () =>
   gulp.src('websites/**/*.html')
      .pipe(size({ showFiles: true }))
      .pipe(htmlHint(htmlHintConfig))
      .pipe(htmlHint.reporter())
      .pipe(htmlValidator())
      .pipe(htmlValidator.reporter());

// Gulp
gulp.task('validate-html', validateHtml);
