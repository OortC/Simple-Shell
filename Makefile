# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyeunkim <hyeunkim@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/05 21:19:13 by hyeunkim          #+#    #+#              #
#    Updated: 2024/04/23 14:04:59 by hyeunkim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#-----STANDARD-----#
NAME = mongshell

CC = cc
CFLAG = -Wall -Wextra -Werror

FT_DIR = ./libft
RD_DIR = /opt/homebrew/opt/readline

FT_FLAG = -L$(FT_DIR) -L$(RD_DIR)/lib -l ft -l readline
INC_FLAG = -I. -I$(FT_DIR) -I$(RD_DIR)/include

#------COLORS-------#
RESET = \033[0m
BOLD = \033[1m
RED = \033[31m
GREEN = \033[32m
GRAY = \033[90m

#-------FILES-------#
MAN_DIR = ./src

COMP_SRCS = $(if $(filter bonus,$(MAKECMDGOAL)),$(bon_src),$(SRCS_M))
COMP_OBJS = $(COMP_SRCS:.c=.o)
COMP_DEPS = $(COMP_SRCS:.c=.d)

FILES =	main				\
		free				\
		error				\
		string				\
		heredoc				\
		signal				\
		signal_set			\
		tokenize			\
		token_util			\
		tree_pipe			\
		tree_simple			\
		tree_standard		\
		tree_compound		\
		tree_util			\
		expand				\
		expand_envp			\
		expand_util			\
		wildcard			\
		wildcard_util		\
		execute				\
		execute_util		\
		execute_pipe		\
		execute_builtin		\
		builtin_cd			\
		builtin_env			\
		builtin_pwd			\
		builtin_echo		\
		builtin_util		\
		builtin_exit		\
		builtin_unset		\
		builtin_export		\

INCS =	function			\
		struct				\

#------SOURCE------#
DIR_SRC = ./src/

SRC_FILE =	$(addprefix $(DIR_SRC), $(FILES))
SRC_INC =	$(addprefix $(DIR_SRC), $(INCS))

SRC_SRCS =	$(addsuffix .c, $(SRC_FILE))
SRC_OBJS =	$(addsuffix .o, $(SRC_FILE))
SRC_INCS =	$(addsuffix .h, $(SRC_INC))

#------FUCTION------#
all : $(NAME)

$(DIR_SRC)%.o : $(DIR_SRC)%.c
	@echo "$(YELLOW)Compiling... $<$(RESET)"
	@$(CC) $(CFLAG) $(INC_FLAG) -c $< -o $@

$(NAME) : $(SRC_OBJS) $(SRC_INCS)
	@echo "$(GREEN)Linking Files...$(RESET)"
	@make -C $(FT_DIR)
	@$(CC) $(CFLAG) $(INC_FLAG) $(FT_FLAG) $(SRC_SRCS) -o $(NAME)
	@echo "$(GREEN)Build Complete - $(NAME)$(RESET)"

clean :
	@echo "$(RED)Cleaning Object Files...$(RESET)"
	@make clean -C $(FT_DIR)
	@rm -rf $(SRC_OBJS)

fclean : clean
	@echo "$(RED)Removing Executable $(NAME)...$(RESET)"
	@make fclean -C $(FT_DIR)
	@rm -rf $(NAME)

re : fclean all

.PHONY : all clean fclean re