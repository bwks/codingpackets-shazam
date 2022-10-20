/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    'codingpackets/_site/**/*.{html,js}'
  ],
  safelist: [],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Ubuntu"],
        mono: ["Ubuntu Mono"],
      },
    },
    plugins: [],
  }
}