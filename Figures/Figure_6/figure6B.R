# Figure 6B
# Mutations within VSG hypervariable region shift antibody binding
# Smith 2024

# read in data
facs_samples <- readr::read_csv("./single_clones_combo.csv", col_names = c("CloneCode", "staining", "expt", "clone"))

controls <- facs_samples %>%
  filter(clone == "control")

expts <- facs_samples %>%
  filter(clone != "control")


controls_sum <- controls %>%
  group_by(CloneCode) %>%
  summarise(avg = mean(staining), stdev = sd(staining))

norm_controls <- full_join(controls, controls_sum, by = "CloneCode") %>%
  mutate(norm_stain = staining/avg*100) %>%
  mutate(old_clone_name = "blagh")

norm_controls_sum <- norm_controls %>%
  summarise(avg_final = mean(norm_stain), stdev_final = sd(norm_stain)) %>%
  mutate(clone = "control") %>%
  mutate(old_clone_name = "blagh")

expts_sum <- expts %>%
  separate(CloneCode,sep = "-", c("CloneCode", "old_clone_name"))

norm_expt <- full_join(expts_sum, controls_sum, by = "CloneCode") %>%
  mutate(norm_stain = staining/avg*100) 

norm_expts_sum <- norm_expt %>%
  ungroup() %>%
  group_by(clone) %>%
  summarise(avg_final = mean(norm_stain), stdev_final = sd(norm_stain))

final_sum <- bind_rows(norm_expts_sum, norm_controls_sum)
final_points <- bind_rows(norm_expt, norm_controls)

final_points <- qPCRr::reorder_samples(final_points, "clone", c("control", "C1", "C2", "C3", "C4", "C5"))

write_csv(final_points, "facs_points.csv")

#plot data
ggplot(data = final_points) +
  geom_jitter(aes(x = clone, y = norm_stain)) +
  geom_crossbar(data = final_sum, aes(x = clone, y = avg_final, ymin = avg_final, ymax = avg_final)) +
  geom_errorbar(data = final_sum, aes(x = clone, y = avg_final, ymin = avg_final - stdev_final, ymax = avg_final + stdev_final)) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size = 20,
                                                     angle = 90,
                                                     hjust = 1,
                                                     vjust = 0.5),
                 axis.text.y = ggplot2::element_text(size = 20),
                 axis.title.y = ggplot2::element_text(size = 25),
                 axis.title.x = ggplot2::element_text(size = 25),
                 plot.background = ggplot2::element_blank(),
                 panel.background = ggplot2::element_blank(),
                 panel.border = element_rect(fill = NA,colour = "grey50"),
                 axis.line = ggplot2::element_line(color = "black", size = 2),
                 axis.ticks.length = ggplot2::unit(0.25, "cm"),
                 legend.position = "right",
                 strip.text.x = ggplot2::element_text(size = 20),
                 legend.title = ggplot2::element_text(size = 15,
                                                      face = "bold",
                                                      hjust = 0.5),
                 legend.key = ggplot2::element_rect(fill = "white"),
                 legend.text = ggplot2::element_text(size = 15)) +
  ggplot2::labs(x = "Clone", y = "Percent AnTat staining") +
  scale_y_continuous(breaks = seq(0,130, by=25))

# one way ANOVA
model <- aov(norm_stain ~ clone, data = final_points)
summary(model)
TukeyHSD(model)
