<h1 align="center">
Phoenix LiveView
<br/>
Frontend Mentor - Todo app
</h1>

<div align="center">

[ENGLISH][lang-en]
|
[PORTUGUÊS][lang-pt]
|
[日本語][lang-jp]

</div>

<div align="center">

[![card-languages]][btn-null]
[![card-last-commit]][btn-null]
[![card-repo-size]][btn-goto-clone]
[![card-code-size]][btn-null]
[![card-license]][btn-goto-license]
[![card-issues]][btn-goto-issues]

</div>

## About

This is a application made for a job process. The challenge was to create a
Phoenix LiveView Application based on a todo app from "Frontend Mentor".

**Note: No database setup to make it easy to test locally, all my free tiers
elixir servers are being used.**

### :trophy: The challenge

The challenge was to build out a todo app and get it looking as close to
the design as possible.

Users should be able to:

- [x] View the optimal layout for the app depending on their device's screen size
- [x] See hover states for all interactive elements on the page
- [x] Add new todos to the list
- [x] Mark todos as complete
- [x] Delete todos from the list
- [x] Filter by all/active/complete todos
- [x] Clear all completed todos
- [x] Toggle light and dark mode
- [ ] **Bonus**: Drag and drop to reorder items on the list
- [ ] ~~**Bonus**: Fullstack application with database~~

![Design preview for the Todo app coding challenge][design-path]

### :hacker_cat: My experience

This was my first time creating a Live View SPA. I think was a worth
experience, is very interesting not use any JS, but I also think is too
expensive to maintain an app with Live View, at least when you do not need
it, like in this todo app.

I was struggling when thinking how I would test the frontend in a Live View
application, but as always, elixir make it very easy.

**Phoenix.LiveViewTest** could have some other methods to query a element,
but it stills is very useful.

## :camera: Screenshots

<div align="center">

![my-result]

</div>

## :triangular_ruler: Technology

- Phoenix LiveView
- HEEx
- CSS

## :electric_plug: Requirements <span id="id-clone"/>

Before to start, you will need have installed on your computer these programs:

- [Git][btn-git]
- [Elixir][btn-elixir]

Also is good have a code editor like [VSCode][btn-vscode].

## :bulb: Do it by yourself

### Cloning

In your terminal clone the repository and install the dependencies.

###### - to clone the repository

```bash
git clone https://github.com/ruanmoreiraofc/todo-app-live-view-elixir.git
```

###### - to enter into the folder

```bash
cd todo-app-live-view-elixir
```

###### - to install the dependencies

```bash
mix deps.get
```

### Usage

Now see the result with:

###### - to test the project

```bash
mix test
```

###### - to run the server

```bash
mix phx.server
```

It will expose the app in [localhost:4000][btn-localhost]

## :balance_scale: License <span id="id-license"/>

This project is under the MIT license. See the [LICENSE][btn-license] for more information.

# :boy: Author <span id="id-author"/>

<div align="center">

  <p>
    <img
      alt="author-img"
      title="Ruan Moreira de Jesus"
      width="100"
      src="https://github.com/ruanmoreiraofc.png">
  </p>

  <!-- ![author-img] does not work with Github's default profile image -->

Made with :heart: by Ruan Moreira de Jesus!

[![author-card-email]][author-btn-email]
[![author-card-discord]][author-btn-discord]
[![author-card-github]][author-btn-github]

</div>

<!--
  ***---- VARIABLES ----***
-->

[btn-null]: #

<!-- *** AUTHOR *** -->

[author-img]: https://github.com/ruanmoreiraofc.png?size=100 "Ruan Moreira de Jesus"
[author-card-email]: https://img.shields.io/badge/Email--$?style=social&logo=microsoft-outlook
[author-card-discord]: https://img.shields.io/badge/Discord--$?style=social&logo=discord
[author-card-github]: https://img.shields.io/github/followers/ruanmoreiraofc?style=social
[author-btn-email]: mailto:ruanmoreiraofc@hotmail.com "Get in touch!"
[author-btn-discord]: #RuanMoreiraOfc#7904 "RuanMoreiraOfc#7904"
[author-btn-github]: https://github.com/ruanmoreiraofc "Github Profile"

<!-- *** LANGUAGES README *** -->

[lang-en]: #
[lang-pt]: #
[lang-jp]: #

<!-- *** INFO CARDS *** -->

[card-languages]: https://img.shields.io/github/languages/count/ruanmoreiraofc/todo-app-live-view-elixir?style=for-the-badge&label=Languages
[card-last-commit]: https://img.shields.io/github/last-commit/ruanmoreiraofc/todo-app-live-view-elixir?style=for-the-badge&label=Last%20Commit
[card-repo-size]: https://img.shields.io/github/repo-size/ruanmoreiraofc/todo-app-live-view-elixir?style=for-the-badge&label=Repo%20Size
[card-code-size]: https://img.shields.io/github/languages/code-size/ruanmoreiraofc/todo-app-live-view-elixir?style=for-the-badge&label=Code%20Size
[card-license]: https://img.shields.io/github/license/ruanmoreiraofc/todo-app-live-view-elixir?style=for-the-badge&label=License
[card-issues]: https://img.shields.io/github/issues/ruanmoreiraofc/todo-app-live-view-elixir?style=for-the-badge

<!-- *** MAIN BUTTONS *** -->

[btn-git]: https://git-scm.com
[btn-elixir]: https://elixir-lang.org/install.html
[btn-vscode]: https://code.visualstudio.com
[btn-license]: LICENSE

<!-- CARDS -->

[btn-goto-clone]: #id-clone
[btn-goto-license]: #id-license
[btn-goto-issues]: https://github.com/ruanmoreiraofc/todo-app-live-view-elixir/issues?q=is%3Aopen

<!-- SCREENSHOTS -->

[design-path]: ./assets/design/desktop-preview.jpg
[my-result]: ./assets/design/my-result.gif

<!-- DO IT BY YOURSELF -->

[btn-localhost]: http://localhost:4000
