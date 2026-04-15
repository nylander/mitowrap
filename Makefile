# Makefile for mitowrap
# Last modified: 2026-04-15 11:46:28
# Sign: JN

.PHONY: all run debug dryrun report slurm-run dardel-run clean distclean

all: run

run:
	snakemake -j 16 --configfile config.yaml --latency-wait 60

debug:
	snakemake -j 16 --printshellcmds --notemp --reason --configfile config.yaml --latency-wait 60

dryrun:
	snakemake -j 16 --printshellcmds --configfile config.yaml --latency-wait 60 --dry-run

report:
	snakemake --report mitowrap-report.html

slurm-run:
	snakemake --profile slurm -j 200

dardel-run:
	snakemake --profile dardel

clean:
	rm -rf .snakemake mitowrap-report.html .animal_db_added .animal_db.log .ete_data_added mitoz.log .using_conda

distclean:
	rm -rf results .snakemake mitowrap-report.html .animal_db_added .animal_db.log .ete_data_added mitoz.log .using_conda
