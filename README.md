# CDC Environmental Justice Index (EJI) County Map series

Website: [EJI Country Maps](https://willf.github.io/cdc_eji_county_level_reports/)

This code:

1. Contains an index.html that allows one to select a county-level map to display either from the CDC's website, or from a GitHub repository.
2. Contains code to _scrape_ the CDC's website for data files.
3. Contains code to create repositories, one for each state, for the data files.

## Installation

1. Clone this repository.
2. Install [`uv`](https://docs.astral.sh/uv/)
3. Run `uv sync` to install dependencies.

## Scraping the CDC's website

1. Run `uv run scrape_cdc_county_level_reports.py` to scrape the CDC's website for data files. (Run `uv run scrape_cdc_county_level_reports.py --help` the first time to see options for where to put data files.)

## Creating repositories

1. Run `./create_repos.sh <data_dir>` to create repositories for each state. If you want to use a different organization, you'll have to change the code. Currently, it is set to the `edgi-govdata-archiving` organization.
