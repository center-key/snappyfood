// Snappy Food

// Imports
import gulp from     'gulp';
import htmlHint from 'gulp-htmlhint';
import size from     'gulp-size';
import { htmlValidator } from 'gulp-w3c-html-validator';

// Setup
const htmlHintConfig = { 'attr-value-double-quotes': false };

// Tasks
const validateHtml = () =>
   gulp.src('websites/**/*.html')
      .pipe(size({ showFiles: true }))
      .pipe(htmlHint(htmlHintConfig))
      .pipe(htmlHint.reporter())
      .pipe(htmlValidator.analyzer())
      .pipe(htmlValidator.reporter());

// Gulp
gulp.task('validate-html', validateHtml);
