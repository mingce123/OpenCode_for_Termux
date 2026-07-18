#!/data/data/com.termux/files/usr/bin/bash
# OpenCode for Termux (ARM64) 一键安装脚本
# 适用版本: 1.17.3

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_step() { echo -e "${BLUE}▶${NC} $1"; }
print_ok() { echo -e "${GREEN}✅${NC} $1"; }
print_warn() { echo -e "${YELLOW}⚠️${NC} $1"; }
print_error() { echo -e "${RED}❌${NC} $1"; }

termux-setup-storage

#复制 deb 包到 Termux 环境
cp "./opencode_1.17.3_aarch64.deb" "$HOME/opencode_1.17.3_aarch64.deb"

# 检查架构
ARCH=$(uname -m)
if [ "$ARCH" != "aarch64" ]; then
    print_error "不支持的架构: $ARCH，仅支持 aarch64"
    exit 1
fi
print_ok "架构检测通过: $ARCH"

# 检查 Termux 环境
if [ -z "$PREFIX" ] || [ ! -d "$PREFIX" ]; then
    print_error "请在 Termux 环境中运行此脚本"
    exit 1
fi

# 检查 deb 包是否存在
DEB_FILE="$HOME/opencode_1.17.3_aarch64.deb"
if [ ! -f "$DEB_FILE" ]; then
    print_error "未找到 deb 包: $DEB_FILE"
    echo "请将 opencode_1.17.3_aarch64.deb 放在 ~/ 目录下"
    exit 1
fi
print_ok "找到 deb 包: $DEB_FILE"
print_step "建议使用魔法🔮，否则下载速度会很慢"
print_step "更新软件源..."
pkg update -y > /dev/null 2>&1
print_ok "软件源更新完成"

print_step "安装 glibc 兼容层..."
apt install -y glibc-repo > /dev/null 2>&1
apt update > /dev/null 2>&1
apt install -y glibc openssl-glibc -y
print_ok "glibc 安装完成"

print_step "安装 OpenCode..."
apt install -y "$DEB_FILE" > /dev/null 2>&1
print_ok "OpenCode 安装完成"

print_step "创建启动脚本..."
cat > "$HOME/run-opencode" << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
unset LD_LIBRARY_PATH
unset LD_PRELOAD
exec /data/data/com.termux/files/usr/glibc/lib/ld-linux-aarch64.so.1 /data/data/com.termux/files/usr/bin/opencode "$@"
EOF
chmod +x "$HOME/run-opencode"
print_ok "启动脚本创建完成: ~/run-opencode"

print_step "添加别名到 .bashrc..."
if ! grep -q "alias oc=" "$HOME/.bashrc" 2>/dev/null; then
    echo 'alias oc="~/run-opencode"' >> "$HOME/.bashrc"
    print_ok "别名已添加"
else
    print_warn "别名已存在，跳过"
fi

rm -f $HOME/opencode_1.17.3_aarch64.deb

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}🎉 OpenCode 安装完成！${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
rm 
echo ""
echo "📝 使用方法："
echo ""
echo "1. 配置 API Key："
echo -e "   ${YELLOW}export ANTHROPIC_API_KEY=\"sk-ant-你的密钥\"${NC}"
echo ""
echo "2. 启动 OpenCode："
echo -e "   ${YELLOW}opencode${NC}"
echo ""
echo "   或重新打开 Termux 后直接用："
echo -e "   ${YELLOW}oc${NC}"
echo ""
echo "3. 验证版本："
echo -e "   ${YELLOW}opencode --version${NC}"
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
