# Friouardle

Friouardle is a word-guessing game inspired by the popular game Wordle, with a twist! It features different themes such as Dungeons and Dragons, Manga, Pokemon, and Movies/Series, adding a unique flavor to the gameplay experience. The game is built using the Phoenix framework and Elixir programming language.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Gameplay](#gameplay)
- [Themes](#themes)
- [Contributing](#contributing)
- [License](#license)

## Features

- Multiple game themes to choose from: Dungeons and Dragons, Manga, Pokemon, and Movies/Series.
- Engaging word-guessing gameplay.
- Randomly generated words based on the selected theme.
- User-friendly interface.
- Real-time feedback on guessed words.
- Tracking of game history and statistics.

## Getting Started

To run Friouardle locally, you need to have Elixir and Phoenix installed on your machine. Follow these steps:

1. Clone the repository:

```bash
git clone https://github.com/your-username/friouardle.git
```

2. Install dependencies:
- cd friouardle
- mix deps.get

3.  Set up the database: mix ecto.setup
4. Start the Phoenix server: mix phx.server
5. Open your web browser and visit http://localhost:4000 to play Friouardle.

## Gameplay

- Choose a theme: At the start of the game, you can select from the available themes: Dungeons and Dragons, Manga, Pokemon, or Movies/Series.
- Guess the word: The game presents you with a hidden word based on the chosen theme. Try to guess the word by entering your guesses.
- Feedback: After each guess, Friouardle provides feedback on your guess, indicating correct letters in the correct positions with green color and correct letters in the wrong positions with yellow color.
- Keep guessing: Continue guessing the word until you successfully guess it or run out of attempts.
- Play again: After each game, you can choose to play again with the same theme or switch to a different theme.


## Themes

Friouardle offers the following themes:

- Dungeons and Dragons: Guess words related to the fantastic world of Dungeons and Dragons, including creatures, spells, and famous locations.
- Manga: Test your knowledge of popular manga series by guessing characters, titles, or special terms.
- Pokemon: Explore the world of Pokemon and guess the names of different Pokemon species, trainers, or regions.
- Movies/Series: Guess words related to popular movies or TV series, such as character names, iconic quotes, or famous locations.

## Contributing

Contributions to Friouardle are welcome! If you would like to contribute to this project, please follow these steps:
1. Fork the repository.
2. Create a new branch for your feature or bug fix:
```bash
git checkout -b my-feature
```

3. Make your changes and commit them with descriptive commit messages.
4. Push your changes to your forked repository:
```bash
git push origin my-feature
```
5. Open a pull request, providing a clear description of your changes.
6. 
## License
The Friouardle project is licensed under the MIT License. Feel free to modify and distribute it as per the terms of the license.



