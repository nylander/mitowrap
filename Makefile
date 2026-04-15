# Makefile for mitowrap
# Last modified: 2026-04-15 13:37:10
# Sign: JN

.PHONY: all run debug dryrun report slurm-run dardel-run clean distclean

all: run

run:
	snakemake --configfile config.yaml -j 16 --use-conda --latency-wait 60

debug:
	snakemake --configfile config.yaml -j 16 --use-conda --printshellcmds --notemp --reason --latency-wait 60

dryrun:
	snakemake --configfile config.yaml -j 16 --use-conda --printshellcmds --latency-wait 60 --dry-run

report:
	snakemake --report mitowrap-report.html

slurm-run:
	snakemake --configfile config.yaml --profile slurm -j 200

dardel-run:
	snakemake --configfile config.yaml --profile dardel

clean:
	rm -rf .snakemake mitowrap-report.html .animal_db_added .animal_db.log .ete_data_added mitoz.log .using_conda

distclean:
	rm -rf results .snakemake mitowrap-report.html .animal_db_added .animal_db.log .ete_data_added mitoz.log .using_conda
