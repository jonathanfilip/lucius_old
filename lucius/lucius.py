from __future__ import absolute_import
from __future__ import division
from __future__ import with_statement

import os
import re


IGNORE_LIST = ["Ignore", "SpellBad", "SpellCap", "SpellRare", "SpellLocal"]

DARK = "LuciusDark"
DARK_DIM = "LuciusDarkDim"
LIGHT = "LuciusLight"

THEMES = [DARK, DARK_DIM, LIGHT]
LIGHT_THEMES = [LIGHT]
DARK_THEMES = [DARK, DARK_DIM]

GIT = os.path.join(os.environ.get("HOME"), "lucius")
GIT_LUCIUS = os.path.join(GIT, "lucius")


class Lucius(object):
    def __init__(self):
        self.file_data = None
        self.colors = dict()
        self.ansi_colors = dict()
        self.load_file_data()
        self.load_dict()
        self.add_ansi_definitions()

    def load_file_data(self):
        with open(os.path.join(GIT, "vimfiles/colors/lucius.vim")) as fd:
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

    def add_ansi_definitions(self):
        self.ansi_colors = dict()
        for theme in THEMES:
            d = dict()
            self.ansi_colors[theme] = d
            if theme in LIGHT_THEMES:
                d["ansi0"] = self.get_fg(theme, "Normal")
                d["black"] = self.get_fg(theme, "Normal")
                d["ansi1"] = self.get_fg(theme, "Normal")
                d["black_bold"] = self.get_fg(theme, "Normal")
            else:
                d["ansi0"] = self.get_bg(theme, "Normal")
                d["black"] = self.get_bg(theme, "Normal")
                d["ansi1"] = self.get_bg(theme, "Normal")
                d["black_bold"] = self.get_bg(theme, "Normal")
            d["ansi2"] = self.get_fg(theme, "ErrorMsg")
            d["red"] = self.get_fg(theme, "ErrorMsg")
            d["ansi3"] = self.get_fg(theme, "ErrorMsg")
            d["red_bold"] = self.get_fg(theme, "ErrorMsg")
            d["ansi4"] = self.get_fg(theme, "Identifier")
            d["green"] = self.get_fg(theme, "Identifier")
            d["ansi5"] = self.get_fg(theme, "Identifier")
            d["green_bold"] = self.get_fg(theme, "Identifier")
            d["ansi6"] = self.get_fg(theme, "Constant")
            d["yellow"] = self.get_fg(theme, "Constant")
            d["ansi7"] = self.get_fg(theme, "Constant")
            d["yellow_bold"] = self.get_fg(theme, "Constant")
            d["ansi8"] = self.get_fg(theme, "Statement")
            d["blue"] = self.get_fg(theme, "Statement")
            d["ansi9"] = self.get_fg(theme, "Statement")
            d["blue_bold"] = self.get_fg(theme, "Statement")
            d["ansi10"] = self.get_fg(theme, "Special")
            d["magenta"] = self.get_fg(theme, "Special")
            d["ansi11"] = self.get_fg(theme, "Special")
            d["magenta_bold"] = self.get_fg(theme, "Special")
            d["ansi12"] = self.get_fg(theme, "PreProc")
            d["cyan"] = self.get_fg(theme, "PreProc")
            d["ansi13"] = self.get_fg(theme, "PreProc")
            d["cyan_bold"] = self.get_fg(theme, "PreProc")
            if theme in LIGHT_THEMES:
                d["ansi14"] = self.get_bg(theme, "Normal")
                d["white"] = self.get_bg(theme, "Normal")
                d["ansi15"] = self.get_bg(theme, "Normal")
                d["white_bold"] = self.get_bg(theme, "Normal")
            else:
                d["ansi14"] = self.get_fg(theme, "Normal")
                d["white"] = self.get_fg(theme, "Normal")
                d["ansi15"] = self.get_fg(theme, "Normal")
                d["white_bold"] = self.get_fg(theme, "Normal")

    def get_bg(self, theme, name):
        return self._get_color(theme, name, "bg")

    def get_fg(self, theme, name):
        return self._get_color(theme, name, "fg")

    def get_bg_rgb(self, theme, name):
        hex_color = self._get_color(theme, name, "bg")
        return self.hex_to_rgb(hex_color)

    def get_fg_rgb(self, theme, name):
        hex_color = self._get_color(theme, name, "fg")
        return self.hex_to_rgb(hex_color)

    def get_ansi(self, theme, name):
        return self.ansi_colors[theme][name]

    def get_ansi_rgb(self, theme, name):
        return self.hex_to_rgb(self.ansi_colors[theme][name])

    def hex_to_rgb(self, hex_color):
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

    def write_all(self):
        self.write_putty()
        self.write_iterm2()

    def write_putty(self):
        def srgb(rgb):
            return ",".join([str(c) for c in rgb])
        putty_dir = os.path.join(GIT_LUCIUS, "putty")
        if not os.path.exists(putty_dir):
            os.mkdir(putty_dir)
        for theme in THEMES:
            d = dict()
            d.update(self.ansi_colors[theme])
            d["fg"] = self.get_fg(theme, "Normal")
            d["fg_bold"] = self.get_fg(theme, "Normal")
            d["bg"] = self.get_bg(theme, "Normal")
            d["bg_bold"] = self.get_bg(theme, "Normal")
            d["cursor_text"] = self.get_bg(theme, "Normal")
            d["cursor"] = self.get_bg(theme, "Cursor")
            for k in d:
                d[k] = srgb(self.hex_to_rgb(d[k]))
            d["name"] = theme
            file_data = _PUTTY % d
            with open(os.path.join(putty_dir, theme + ".reg"), "w") as fd:
                fd.write(file_data)

    def write_iterm2(self):
        iterm_dir = os.path.join(GIT_LUCIUS, "iterm2")
        if not os.path.exists(iterm_dir):
            os.mkdir(iterm_dir)
        for theme in THEMES:
            entries = []
            for i in range(16):
                r, g, b = self.get_ansi_rgb(theme, "ansi%d" % i)
                entry = _ITERM_ENTRY
                name = "Ansi %d Color" % i
                d = dict(name=name, red=r/255.0, green=g/255.0, blue=b/255.0)
                entry = entry % d
                entries.append(entry)
            color_map = dict()
            color_map["Background Color"] = self.get_bg_rgb(theme, "Normal")
            color_map["Bold Color"] = self.get_fg_rgb(theme, "Normal")
            color_map["Cursor Color"] = self.get_bg_rgb(theme, "Cursor")
            color_map["Cursor Text Color"] = self.get_bg_rgb(theme, "Normal")
            color_map["Foreground Color"] = self.get_fg_rgb(theme, "Normal")
            color_map["Selected Text Color"] = self.get_fg_rgb(theme, "Normal")
            color_map["Selection Color"] = self.get_bg_rgb(theme, "Visual")
            for k in color_map:
                r, g, b = color_map[k]
                entry = _ITERM_ENTRY
                d = dict(name=k, red=r/255.0, green=g/255.0, blue=b/255.0)
                entry = entry % d
                entries.append(entry)
            file_data = _ITERM % "\n".join(entries)
            with open(os.path.join(iterm_dir, theme + ".itermcolors"), "w") as fd:
                fd.write(file_data)


_PUTTY = """\
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions\%(name)s]
"Colour0"="%(fg)s"
"Colour1"="%(fg_bold)s"
"Colour2"="%(bg)s"
"Colour3"="%(bg_bold)s"
"Colour4"="%(cursor_text)s"
"Colour5"="%(cursor)s"
"Colour6"="%(black)s"
"Colour7"="%(black_bold)s"
"Colour8"="%(red)s"
"Colour9"="%(red_bold)s"
"Colour10"="%(green)s"
"Colour11"="%(green_bold)s"
"Colour12"="%(yellow)s"
"Colour13"="%(yellow_bold)s"
"Colour14"="%(blue)s"
"Colour15"="%(blue_bold)s"
"Colour16"="%(magenta)s"
"Colour17"="%(magenta_bold)s"
"Colour18"="%(cyan)s"
"Colour19"="%(cyan_bold)s"
"Colour20"="%(white)s"
"Colour21"="%(white_bold)s"
"""


_ITERM = """\
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
%s
</dict>
</plist>
"""


_ITERM_ENTRY = """\
    <key>%(name)s</key>
    <dict>
        <key>Blue Component</key>
        <real>%(blue)f</real>
        <key>Green Component</key>
        <real>%(green)f</real>
        <key>Red Component</key>
        <real>%(red)f</real>
    </dict>"""
