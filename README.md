# Getting and cleaning data - course project

Here you can find a script - run_analysis.R which transform a raw datasets to tidy data.

The main steps are:

1. Reading a raw data of train and test from Samsung device.
2. Merging Y_variables with appropriate activity name (f.e. 1 = Walking etc)
3. Combining train and text datasets together.
4. Selecting special columns of means and std.
5. Computing a mean data for variables group by subject and activity.
6. Writing a tidy data to txt file.

Please find additional information in script comments.

The data is tidy, because it matches this rules:

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

Please find more information about variables in Codebook.md
