echo '################################## apt-get install start ##################################'
# DEBIAN_FRONTEND=noninteractive
apt-get update -y
# R 3.4.1 설치용
apt-get install -y gfortran zip liblapack-dev libblas-dev libpaper-utils xdg-utils libblas3 libcairo2 libjpeg8 liblapack3 libpango-1.0-0 libpangocairo-1.0-0 libtcl8.6 libtiff5 libtk8.6 libudunits2-dev libxml2-dev libfontconfig1-dev libmariadb-client-lgpl-dev
apt-get -f install -y
echo '####### os check version start #######'
cat /etc/os-release
echo '####### os check version end #######'
echo '####### python check version start #######'
/home/splunk/miniconda3/bin/pip freeze
echo '####### python check version end #######'
echo '################################## apt-get install  end ##################################'

echo '################################## install R start ##################################'
wget https://cran.rstudio.com/bin/linux/ubuntu/xenial/r-base-core_3.4.1-1xenial0_amd64.deb
dpkg -i r-base-core_3.4.1-1xenial0_amd64.deb
rm r-base-core_3.4.1-1xenial0_amd64.deb
PATH=/usr/bin/R:${PATH}
echo '################################## install R end ##################################'

echo '################################## R version ##################################'
R --version
echo '################################## R version ##################################'

echo '################################## R package install start ##################################'
R -e "install.packages('data.table', repos='https://cran.r-project.org/', dependencies=TRUE)"
R -e "install.packages('ggplot2', repos='https://cran.r-project.org/', dependencies=TRUE)"
R -e "install.packages('dplyr', repos='https://cran.r-project.org/', dependencies=TRUE)"
R -e "install.packages('tseries', repos='https://cran.r-project.org/', dependencies=TRUE)"
R -e "install.packages('robustbase', repos='https://cran.r-project.org/', dependencies=TRUE)"
R -e "install.packages('forecast', repos='https://cran.r-project.org/', dependencies=TRUE)"
R -e "install.packages('RMySQL', repos='https://cran.r-project.org/', dependencies=TRUE)"
R -e "install.packages('futile.logger', repos='http://cran.r-project.org/', dependencies=TRUE)"
#R -e "install.packages('cvTools', repos='https://cran.r-project.org/', dependencies=TRUE)"
#R -e "install.packages('segmented', repos='https://cran.r-project.org/', dependencies=TRUE)"

# Robustbase 의존성 추가
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/DEoptimR/DEoptimR_1.0-8.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/BH/BH_1.72.0-3.tar.gz', repos=NULL, type='source', dependencies=TRUE)"

R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/plyr/plyr_1.8.4.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/reshape2/reshape2_1.4.2.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/data.table/data.table_1.10.4-3.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/ggplot2/ggplot2_2.2.1.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/dplyr/dplyr_0.8.4.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/DBI/DBI_0.8.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/RMySQL/RMySQL_0.10.19.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/RcppArmadillo/RcppArmadillo_0.9.900.3.0.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/forecast/forecast_8.4.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/lattice/lattice_0.20-33.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/lubridate/lubridate_1.6.0.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/nnet/nnet_7.3-12.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/robustbase/robustbase_0.92-7.tar.gz', repos=NULL, type='source',dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/sandwich/sandwich_2.5-0.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/stringr/stringr_1.2.0.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/tseries/tseries_0.10-46.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/zoo/zoo_1.8-4.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/segmented/segmented_1.1-0.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
R -e "install.packages('https://cran.r-project.org/src/contrib/cvTools_0.3.2.tar.gz', repos=NULL, type='source', dependencies=TRUE)"
echo '################################## R package install end ##################################'

VERSION="DEoptimR 1.0-8"
VERSION+=" plyr 1.8.4"
VERSION+=" reshape2 1.4.2"
VERSION+=" data.table 1.10.4-3"
VERSION+=" ggplot2 2.2.1"
VERSION+=" dplyr 0.8.4"
VERSION+=" DBI 0.8"
VERSION+=" RMySQL 0.10.19"
VERSION+=" RcppArmadillo 0.9.900.3.0"
VERSION+=" forecast 8.4"
VERSION+=" lattice 0.20-33"
VERSION+=" lubridate 1.6.0"
VERSION+=" nnet 7.3-12"
VERSION+=" robustbase 0.92-7"
VERSION+=" sandwich 2.5-0"
VERSION+=" stringr 1.2.0"
VERSION+=" tseries 0.10-46"
VERSION+=" zoo 1.8-4"
VERSION+=" segmented 1.1-0"
VERSION+=" cvTools 0.3.2"
echo "check_version : "$VERSION

Rscript scripts/package_check.R $VERSION

RESULT=$?

echo "package_check.R status : "$RESULT

#SEND_SLACK
curl --insecure -XPOST -H "Content-type: application/json" -d '{
	"text" : "[MM][asset_build][INFO] setup.sh finished. The package version check result is '$RESULT'",
  "icon_emoji" : ":hamster-dance:",
  "username" : "JJ-mon"
}' 'https://hooks.slack.com/services/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'
