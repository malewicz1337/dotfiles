# The Configuration Abyss

Welcome, brave/foolish traveler, to the digital manifestation of my anxiety. This repository isn't a collection of configuration files; it's a meticulously documented descent into madness. Each line of code is a monument to time that could have been spent on something useful, like learning to bake or talking to another human being.

> "I have spent more time configuring my text editor than I have spent writing code in it."
>
> — Every developer, probably.

## The Philosophy (Or Lack Thereof)

The guiding principle here is simple: **Why be productive when you can *feel* productive?**

This setup is engineered to shave nanoseconds off tasks I perform dozens of times a day, a time-saving that is immediately negated by the hours I spend tweaking the font ligatures or changing the color of the active tmux pane border. It's the digital equivalent of building a custom Formula 1 car to go grocery shopping. Sure, it's fast, but you'll spend all weekend in the garage because the KERS unit is acting up again.

## Dissection of the Damned

Here's a breakdown of the various circles of this configuration hell.

### `.zshrc`

The gateway drug. It started with a simple alias for `git status` and has now metastasized into a baroque monstrosity of functions, prompts, and environment variables that I no longer understand. It's so "optimized" that my terminal now takes longer to start than a 1990s desktop PC booting Windows 95.

### `.vimrc` & `.config/nvim/`

Ah, the heart of the beast. My relationship with Vim/Neovim is the longest and most abusive one of my life.

* **`.vimrc`**: A relic. A fossilized reminder of a simpler time before the Great Lua Migration. I keep it here for archaeological purposes. Do not touch it, lest you awaken ancient evils.
* **`init.lua`**: A sprawling metropolis of Lua where plugins are born, fight for supremacy, and are eventually deprecated. I am its weary, god-like mayor. I haven't written a line of actual, shipping code in weeks, but my LSP completion is now faster by a value approaching the Planck time ($t_P$).
* **`lua/malewicz/`**: My so-called "custom" modules. This is where I copy-paste snippets from smarter people on the internet and pretend I came up with them.

### `.config/aerospace/`

Because dragging windows with a mouse is for the unenlightened. My windows now arrange themselves with a brutalist efficiency that mirrors the void in my soul. I haven't seen my desktop wallpaper since 2023. I'm not even sure I have one anymore.

### `.config/wezterm/`

A terminal emulator so fast it renders my typos in glorious, GPU-accelerated 144Hz. It's configured in Lua, because clearly I hadn't written enough Lua configuring Neovim.

### `.config/tmux/`

So I can have terminals within terminals, all showing me different ways I'm failing to meet deadlines. It's like the movie *Inception*, but with more command prompts and existential dread. The status bar provides a constant, unblinking stream of system metrics that confirm my CPU is as idle as my social life.

## Installation: A Cry for Help

You want this curse upon your own house? Seriously? Fine. Who am I to stand in the way of your self-destructive tendencies?

1.  Clone this repository somewhere you'll forget about it.
    ```bash
    git clone https://github.com/malewicz1337/dotfiles.git ~/.dotfiles
    ```
2.  Run some sort of symlinking script that you haven't written yet but swear you will. Or just copy-paste them manually. I don't care. Your life, your rules.
3.  Spend the next 48 hours debugging why your terminal prompt is now just the `?` character and nothing works.
4.  Realize you were happier before.
5.  There is no step 5. This is your life now.

## Acknowledgments

My sincerest gratitude to the creators of these fine tools for enabling this sickness. And to the countless bloggers and GitHub users whose configurations I've plundered in the dead of night. Your work has been invaluable in building this magnificent, pointless temple of configuration.

## License

This project is released under the [MIT License](LICENSE). Feel free to use, copy, modify, and distribute this. If it breaks your machine, you get to keep both pieces. It's probably for the best.
