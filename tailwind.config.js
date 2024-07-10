/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/main/webapp/pages/**/*.{html,jsp}"],
  theme: {
    extend: {
		colors: {
        	customcolor: '#fb923c',
      },
	},
  },
  plugins: [],
}

