/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class',
  content: [
    // 'codingpackets/_site/*.{html,js}',
    'codingpackets/_site/blog/**/*.html'
  ],
  safelist: [],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Bree Serif"],
        mono: ["Ubuntu Mono"],
      },
    },
    plugins: [],
  }
}