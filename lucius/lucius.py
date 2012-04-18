import os
import re


IGNORE_LIST = ["Ignore", "SpellBad", "SpellCap", "SpellRare", "SpellLocal"]

DARK = "LuciusDark"
DARK_DIM = "LuciusDarkDim"
LIGHT = "LuciusLight"


def chunks(l, n):
    c = []
    for i in xrange(0, len(l), n):
        c.append(l[i:i+n])
    return c


class Lucius(object):
    def __init__(self):
        self.file_data = None
        self.colors = dict()
        self.load_file_data()
        self.load_dict()

    def load_file_data(self):
        home = os.environ.get("HOME")
        with open(os.path.join(home, "lucius/vimfiles/colors/lucius.vim")) as fd:
            self.file_data = fd.read()

    def load_dict(self):
        self.colors = dict()
        sections = self.file_data.split('" # ')
        for s in sections:
            if s.startswith("%s {{{" % DARK):
                colors = dict()
                self.load_color_definitions(s, colors)
                self.colors[DARK] = colors
            elif s.startswith("%s {{{" % DARK_DIM):
                colors = dict()
                self.load_color_definitions(s, colors)
                self.colors[DARK_DIM] = colors
            elif s.startswith("%s {{{" % LIGHT):
                colors = dict()
                self.load_color_definitions(s, colors)
                self.colors[LIGHT] = colors
            else:
                pass

    def load_color_definitions(self, section, section_dict):
        name_re = re.compile("hi (\w+) ")
        guifg_re = re.compile("guifg=#*(\w+)")
        guibg_re = re.compile("guibg=#*(\w+)")
        for line in section.splitlines():
            if line.strip().startswith("hi "):
                name = name_re.findall(line)
                if name is None or len(name) == 0:
                    raise Exception("Bad hi definition: %s" % line)
                else:
                    name = name[0]
                if name in IGNORE_LIST:
                    continue
                fg = guifg_re.findall(line)
                if fg is None or len(fg) == 0:
                    raise Exception("Bad fg definition: %s" % line)
                else:
                    fg = fg[0]
                bg = guibg_re.findall(line)
                if bg is None or len(bg) == 0:
                    raise Exception("Bad bg definition: %s" % line)
                else:
                    bg = bg[0]
                section_dict[name] = dict(fg=fg, bg=bg)
            elif line.strip().startswith('" }}}'):
                return

    def get_bg(self, theme, name):
        return self._get_color(theme, name, "bg")

    def get_fg(self, theme, name):
        return self._get_color(theme, name, "fg")

    def get_bg_rgb(self, theme, name):
        hex_color = self._get_color(theme, name, "bg")
        rh, gh, bh = [hex_color[0:2], hex_color[2:4], hex_color[4:6]]
        r, g, b = int(rh, 16), int(gh, 16), int(bh, 16)
        return r, g, b

    def get_fg_rgb(self, theme, name):
        hex_color = self._get_color(theme, name, "fg")
        rh, gh, bh = [hex_color[0:2], hex_color[2:4], hex_color[4:6]]
        r, g, b = int(rh, 16), int(gh, 16), int(bh, 16)
        return r, g, b

    def _get_color(self, theme, name, c):
        color = None
        theme_dict = self.colors.get(theme)
        if theme_dict:
            color = theme_dict.get(name)
            if color:
                color = color[c]
                if color == "bg":
                    color = self._get_color(theme, "Normal", "bg")
                elif color == "fg":
                    color = self._get_color(theme, "Normal", "fg")
                elif color == "NONE":
                    color = self._get_color(theme, "Normal", c)
        if not color:
            raise Exception("Could not find color for %s, %s, %s" % (theme, name, c))
        return color

    def write_putty(self):
        pass


_PUTTY = """\
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions\LuciusLight]
"Colour0"="%s"
"Colour1"="%s"
"Colour2"="%s"
"Colour3"="%s"
"Colour4"="%s"
"Colour5"="%s"
"Colour6"="%s"
"Colour7"="%s"
"Colour8"="%s"
"Colour9"="%s"
"Colour10"="%s"
"Colour11"="%s"
"Colour12"="%s"
"Colour13"="%s"
"Colour14"="%s"
"Colour15"="%s"
"Colour16"="%s"
"Colour17"="%s"
"Colour18"="%s"
"Colour19"="%s"
"Colour20"="%s"
"Colour21"="%s"
"""


