/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        aviation: {
          50:  '#eef4ff',
          100: '#d9e8ff',
          200: '#bcd3ff',
          300: '#8eb5ff',
          400: '#598bff',
          500: '#3366ff',
          600: '#1a47f5',
          700: '#1334e1',
          800: '#162ab6',
          900: '#182a8f',
          950: '#131d57',
        },
        navy: {
          900: '#0f172a',
          800: '#1e293b',
          700: '#334155',
        },
      },
      fontFamily: {
        sans: ['Inter', 'ui-sans-serif', 'system-ui'],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
  ],
}
