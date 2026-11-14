FROM perl:5-trixie

LABEL org.opencontainers.image.title="texlive-ja" \
      org.opencontainers.image.description="TeX Live Japanese environment" \
      org.opencontainers.image.source="https://github.com/pine318/texlive-ja"

ARG USERNAME=texlive
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG USER_GECOS=TeXLive
ARG TL_MIRROR=https://mirror.ctan.org/systems/texlive/tlnet

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
    ghostscript \
    less \
    locales \
    sudo \
    vim \
    && echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && sed -i -e 's/^# *\(en_US.UTF-8 UTF-8\)/\1/' -e 's/^# *\(ja_JP.UTF-8 UTF-8\)/\1/' /etc/locale.gen \
    && locale-gen \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /tmp/install-tl-unx \
    && curl -fsSL ${TL_MIRROR}/install-tl-unx.tar.gz | tar -xz -C /tmp/install-tl-unx --strip-components=1 \
    && printf "%s\n" \
    "selected_scheme scheme-basic" \
    "instopt_adjustpath 1" \
    "tlpdbopt_install_docfiles 0" \
    "tlpdbopt_install_srcfiles 0" \
    > /tmp/install-tl-unx/texlive.profile \
    && /tmp/install-tl-unx/install-tl --profile=/tmp/install-tl-unx/texlive.profile --location ${TL_MIRROR} \
    && rm -rf /tmp/install-tl-unx

RUN tlmgr option repository ${TL_MIRROR} \
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
    && tlmgr path add

# latexindent の依存モジュール
RUN cpanm --notest \
    Log::Log4perl \
    Log::Dispatch::File \
    YAML::Tiny \
    File::HomeDir \
    Unicode::GCString \
    && rm -rf /root/.cpanm

ENV LANG=ja_JP.UTF-8
