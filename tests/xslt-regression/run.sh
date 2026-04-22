#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
EXPECTED_DIR="$ROOT_DIR/tests/xslt-regression/expected"
ACTUAL_DIR="${TMPDIR:-/tmp}/xpub-xslt-regression-$$"

trap 'rm -rf "$ACTUAL_DIR"' EXIT HUP INT TERM
mkdir -p "$ACTUAL_DIR"

run_case() {
  stylesheet=$1
  expected=$2

  xsltproc "$ROOT_DIR/xslt/$stylesheet" "$ROOT_DIR/example/data.xml" > "$ACTUAL_DIR/$expected"
  diff -u "$EXPECTED_DIR/$expected" "$ACTUAL_DIR/$expected"
}

run_case "articles_satysfi_ja.xsl" "articles_satysfi_ja.txt"
run_case "articles_summary_csv.xsl" "articles_summary_csv.txt"
run_case "articles_txt.xsl" "articles_txt.txt"
run_case "editorials_cv_satysfi.xsl" "editorials_cv_satysfi.txt"
run_case "editorials_html.xsl" "editorials_html.xml"
run_case "editorials_satysfi_ja.xsl" "editorials_satysfi_ja.txt"
run_case "minor_papers_satysfi_ja.xsl" "minor_papers_satysfi_ja.txt"
run_case "publications_bibtex.xsl" "publications_bibtex.bib"
run_case "publications_cv_satysfi.xsl" "publications_cv_satysfi.txt"
run_case "publications_html.xsl" "publications_html.xml"
run_case "publications_kaken_report_csv.xsl" "publications_kaken_report_csv.csv"
run_case "publications_kaken_review_committee.xsl" "publications_kaken_review_committee.txt"
run_case "publications_researchmap_csv.xsl" "publications_researchmap_csv.csv"
run_case "publications_txt-boost_2024.xsl" "publications_txt-boost_2024.txt"
