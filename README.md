# Callysto landing pages

This repository contains the files needed by ansible to create the default
callysto.ca landing login/logout pages. There are two important branches:
master-callysto and template-callysto.

## Master-callysto Branch
ALL of your work should be in the master-callysto branch. The template-callysto
branch is the result of `jekyll build` and shouldn't be edited directly. For
example, suppose you wanted to update the login page html. Here is the sequence
of steps

1. Edit index.html
 a. Run jekyll build
 b. Check the contents of _site with `jekyll serve` (or surge)
2. Commit your changes to master
3. Push master up to github
4. Run the publish.sh script

Step 4 hides the management of the template branch. It does something like:

1. Remove any existing _site directory
2. Remove any existing worktree for _site
3. Add a worktree for the template branch at _site
4. Run `jekyll build` to refresh _site
5. Add the new contents of _site to the template branch
6. Commit the changes to template and push to github

The resulting files in the template branch are not valid HTML because they still
contain ansible tags like {{ inventory_hostname }}. On the target machine the
syzygy-html role will clone out the template branch, and evaluate the templates.
