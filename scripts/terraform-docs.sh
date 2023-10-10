
if which terraform-docs >/dev/null; then
    terraform-docs .
elif which docker >/dev/null; then
    echo "## terraform-docs not found in PATH, but docker was found"
    echo "## running terraform-docs in docker"
    terraform_docs_version=$(cat .terraform-docs.yml | grep version | cut -d\" -f 2)
    docker run --rm -v `pwd`:/data cytopia/terraform-docs:${terraform_docs_version} terraform-docs .
else
    echo "## terraform-docs not found in PATH, neither was docker"
    echo "## please install terraform-docs or docker"
    exit 1
fi