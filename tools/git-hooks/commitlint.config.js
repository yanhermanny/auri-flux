module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [2, 'always', ['feat', 'fix', 'chore', 'refactor', 'docs', 'test']],
    'subject-case': [0, 'never'],
    'footer-leading-issue': [2, 'always']
  },
  plugins: [
    {
      rules: {
        'footer-leading-issue': ({footer}) => {
          const pattern = /^(Closes|Fixes|References|See) #\d+/m;
          return pattern.test(footer)
            ? [true, 'ok']
            : [false, 'Footer is required and must reference an issue (Closes #ID, Fixes #ID, References #ID, See #ID)'];
        }
      }
    }
  ]
};
