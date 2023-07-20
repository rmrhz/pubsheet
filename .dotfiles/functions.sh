# (self explanatory)
# -- ChatGPT
function get_untouchable_branches() {
  local filename=".notouch"
  local lines=()

  # Check if the file exists
  if [ ! -f "./locals/$filename" ]; then
    echo "Error: File '$filename' not found in the current directory."
    return 1
  fi

  # Read each line and add it to the array
  while IFS= read -r line; do
    lines+=("$line")
  done < "./locals/$filename"

  # Return the array
  echo "${lines[@]}"
}

# (G)it (D)elete (B)ulk (B)ranches
# -- ChatGPT
# ~ if:get_untouchable_branches returns empty, it will treat all branches to be purged.
function gdbb() {
  # Get the list of unmerged branches
  unmerged_branches=$(git branch --no-merged | grep -v "\*" | grep -v "master" | grep -v "develop")

  # Check if there are any unmerged branches
  if [[ -z $unmerged_branches ]]; then
    echo "No unmerged branches found."
    return 0
  fi

  # Array of branches to exclude from deletion
  excluded_branches=($(get_untouchable_branches))

  # Exclude specified branches from deletion
  for excluded_branch in "${excluded_branches[@]}"; do
    unmerged_branches=("${unmerged_branches[@]/$excluded_branch}")
  done

  # Check if there are any remaining branches to delete
  if [[ ${#unmerged_branches[@]} -eq 0 ]]; then
    echo "All unmerged branches are excluded from deletion."
    return 0
  fi

  # Display the list of unmerged branches
  echo "Unmerged branches:"
  echo "${unmerged_branches[@]}"

  # Prompt for confirmation before deleting branches
  read -p "Are you sure you want to delete these branches? (y/n): " confirmation
  if [[ $confirmation != "y" && $confirmation != "Y" ]]; then
    echo "Branch deletion aborted."
    return 0
  fi

  # Delete unmerged branches
  echo "Deleting branches..."
  for branch in "${unmerged_branches[@]}"; do
    git branch -D "$branch"
  done

  echo "Branch deletion completed."
}
