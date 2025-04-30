NAME = libasm.a
SRCS = sample.s
OBJ_DIR = obj/
OBJS = $(addprefix $(OBJ_DIR), $(SRCS:.s=.o))
BONUS_SRCS = 
BONUS_OBJS = $(addprefix $(OBJ_DIR), $(BONUS_SRCS:.s=.o))
NASM = nasm
NASM_FLAGS = -f elf64
CC = cc
CFLAGS = -Wall -Wextra -Werror
AR = ar
AR_FLAGS = rcs

$(NAME): $(OBJS)
	$(AR) $(AR_FLAGS) $(NAME) $(OBJS)

$(OBJ_DIR)%.o: %.s | $(OBJ_DIR)
	$(NASM) $(NASM_FLAGS) $< -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

all: $(NAME)

clean:
	$(RM) -r $(OBJ_DIR)

fclean: clean
	$(RM) $(NAME)
	$(RM) test

re: fclean all

bonus: $(OBJS) $(BONUS_OBJS)
	$(AR) $(AR_FLAGS) $(NAME) $(OBJS) $(BONUS_OBJS)

test: $(NAME)
	$(CC) $(CFLAGS) -L. -lasm main.c -o test

.PHONY: all clean fclean re test bonus