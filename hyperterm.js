// hyperterm-snazzy
const foregroundColor = '#eff0eb';
const backgroundColor = '#282a36';
const red = '#ff5c57';
const green = '#5af78e';
const yellow = '#f3f99d';
const blue = '#57c7ff';
const magenta = '#ff6ac1';
const cyan = '#9aedfe';

module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 12,

    // font family with optional fallbacks
    fontFamily: 'Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    // fontFamily: 'SourceCodePro-ExtraLight',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: '#97979b',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // color of the text
    foregroundColor,

    // terminal background color
    backgroundColor,

    // border color (window, tabs)
    borderColor: blue,

    // custom css to embed in the main window
    css: `
      .tab_active:before {
  			border-color: rgba(255, 106, 193, 0.25);
  		}
    `,

    // custom css to embed in the terminal window
    termCSS: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: backgroundColor,
      red,
      green,
      yellow,
      blue,
      magenta,
      cyan,
      white: '#f1f1f0',
      lightBlack: '#686868',
      lightRed: red,
      lightGreen: green,
      lightYellow: yellow,
      lightBlue: blue,
      lightMagenta: magenta,
      lightCyan: cyan,
      lightWhite: foregroundColor
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: '',

    // for advanced config flags please refer to https://hyperterm.org/#cfg

    hypercwd: {
      initialWorkingDirectory: '~/code'
    }
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hyperterm-cursor',
    'hyperlinks',
    'hypercwd',
    'hyperterm-paste'
    // 'hyperline'
  ],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
