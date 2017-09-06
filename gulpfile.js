// Snappy Food
// gulp configuration and tasks

const gulp =     require('gulp');
const htmlHint = require('gulp-htmlhint');
const size =     require('gulp-size');
const w3cJs =    require('gulp-w3cjs');

const htmlHintConfig = { 'attr-value-double-quotes': false };

function validateHtml() {
   return gulp.src('websites/**/*.html')
      .pipe(size({ showFiles: true }))
      .pipe(w3cJs())
      .pipe(w3cJs.reporter())
      .pipe(htmlHint(htmlHintConfig))
      .pipe(htmlHint.reporter());
   }

gulp.task('validate-html', validateHtml);
