# Vim-Draw
This plugin is made to be used to design box diagrams in Vim easily.

## Installation
Execute the following commands in your terminal.
```shell
$ mkdir -p ~/.vim/bundle/vim-draw
$ git clone https://github.com/weirdsmiley/Vim-Draw.git ~/.vim/bundle/vim-draw/
```

## Configurations and Tips
- Use `visual replace mode` to edit into the diagram  
    - this mode can be invoked by `gR`  

- Difference between `visual replace` and `replace` mode?  
  `replace` mode replaces character for each character you type  
  `V-replace` replaces screen real estate, so that characters further on in the file never appear to move.  

- Why not to use `replace` mode?
  The difference arises for `<TAB>` character. In `replace` mode, one `<TAB>` replaces one whichever character it is. But in `V-replace` mode, it makes it appear that further characters in file are not shifting.  
  For example, draw a box diagram `<leader>boxd` while in `insert` mode.  
```
+----------------+
|                |
+----------------+
```
  Type `<TAB>` while in replace mode. This will replace the whitespace with tab character which will make it shift.  
```
+----------------+
| 	              |
+----------------+
```
  On the other hand, typing `<TAB>` while in `V-replace` mode will not make the right portion shift.
```
+----------------+
| 	         |
+----------------+

The box has a tab character inside it.
```

┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈  
Vim-draw | version 1.0.0
