FROM perl:5-buster

ARG USERNAME=texlive
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG USER_GECOS=TeXLive

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd \
    -s /bin/bash \
    --uid $USER_UID \
    --gid $USER_GID \
    -c "$USER_GECOS" \
    -m $USERNAME
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    apt-utils \
    ghostscript \
    vim \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && apt-get -y install --no-install-recommends \
    locales \
    less \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen

RUN mkdir /tmp/install-tl-unx \
    && curl -Ls http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar -xz -C /tmp/install-tl-unx --strip-components=1 \
    && printf "%s\n" \
    "selected_scheme scheme-basic" \
    "instopt_adjustpath 1" \
    "tlpdbopt_install_docfiles 0" \
    "tlpdbopt_install_srcfiles 0" \
    > /tmp/install-tl-unx/texlive.profile \
    && /tmp/install-tl-unx/install-tl --profile=/tmp/install-tl-unx/texlive.profile

RUN tlmgr init-usertree \
    && tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet \
    && tlmgr update --self --all \
    && tlmgr install \
    collection-fontsrecommended \
    collection-langcjk \
    collection-langjapanese \
    collection-latexextra \
    collection-mathscience \
    newtx \
    latexmk \
    latexindent \
    pdfcrop \
    latexdiff \
    && tlmgr path add \
    && rm -fr /tmp/install-tl-unx

RUN cpanm \
    Log::Log4perl \
    Log::Dispatch::File \
    YAML::Tiny \
    File::HomeDir \
    Unicode::GCString

RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=ja_JP.UTF-8