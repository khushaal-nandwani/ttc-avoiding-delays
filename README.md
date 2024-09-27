# Avoiding Delays on the TTC Streetcar: A Data-Driven Guide for Smarter Travel

## Overview

This repository contains the analysis and supporting materials for the paper "Avoiding Delays in TTC Streetcar". The project aims to explore patterns in streetcar delays on the Toronto Transit Commission (TTC) network by analyzing various factors such as time, direction, streetcar line, and day of the week. By leveraging data from Open Data Toronto, this analysis seeks to offer insights into when and where delays are most likely to occur, helping commuters make more informed travel decisions and assisting transit planners in identifying areas for improvement.

The analysis was performed using R and includes data cleaning, visualization, and statistical summaries. The results are discussed in the accompanying paper, which provides a deeper understanding of the delay patterns and suggests potential strategies for both riders and transit operators to mitigate the impact of delays.

In this repository, you will find the raw and cleaned data, R scripts used for analysis, and the final report generated using Quarto.

## LLM Usage
Certain code and text was written using the help of ChatGPT 4o. Its usage can be tracked under [usage.txt](other/llm/usage.txt)

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from OpenDataToronto.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `other/llm` contains relevant LLM chat interactions
-   `other/sketches` contains sketches used in the paper.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.
