/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class',
  content: [
    'codingpackets/_site/js/custom/*.js',
    'codingpackets/_site/index.html',
    'codingpackets/_site/blog/**/*.html'
  ],
  safelist: [],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Bree Serif"],
        serif: ["Alegreya"],
        mono: ["Ubuntu Mono"],
      },
      colors: {
        gray: {
          950: '#060a11',
          900: '#090f1a',
          800: '#101a2d',
          700: '#233b64',
          600: '#2d4b80',
          500: '#375b9b',
          400: '#416cb7',
          300: '#5980c4',
          200: '#7595ce',
          100: '#90aad8',
          50: '#acbfe2',
          25: '#c8d5eb',
        },
      }
    },
    plugins: [],
  }
}
