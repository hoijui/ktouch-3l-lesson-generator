#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2021 Robin Vobruba <hoijui.quaero@gmail.com>
#
# SPDX-License-Identifier: MIT

# Exit immediately on each error and unset variable;
# see: https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
#set -Eeuo pipefail
set -Eeu

gen_dir="${KTL_GEN:-../ktouch-lesson-generator}"
lesson_spec_file="3l.txt"
dict_en_included_file="$gen_dir/dictionaries/dict-en_uk.txt"
dict_en_big_file="dict-en.txt"
dict_en_url="https://github.com/dwyl/english-words/blob/master/words_alpha.txt?raw=true"
out_file="ktouch-lessons-3l.xml"
big=false
if $big
then
	dict_en_file="$dict_en_big_file"
else
	dict_en_file="$dict_en_included_file"
fi

# Ensure we have the big english words dictionary available
if $big && [ ! -e "$dict_en_file" ]
then
	wget \
		--output-document "$dict_en_file" \
		"$dict_en_url"
fi

# Ensure we have the ktouch lessons generator available
if [ ! -e "$gen_dir" ]
then
	# Get the software
	git clone "https://github.com/simgunz/ktouch-lesson-generator.git" "$gen_dir"
	# Install python dependencies
	pip3 install -r "$gen_dir/requirements.txt"
else
	pushd "$gen_dir"
	git pull || echo "WARNING: Failed to update ktouch-lesson-generator."
	popd
fi

python3 \
	"$gen_dir/ktouch-lesson-generator.py" \
	--keyboard-layout "3l" \
	--course-description "Simple, course for learning the 3l (Three-Layout), generated with ktouch-lesson-generator." \
	--course-title "English 3l (auto-generated)" \
	--output "$out_file" \
	"$lesson_spec_file" \
	"$dict_en_file"
