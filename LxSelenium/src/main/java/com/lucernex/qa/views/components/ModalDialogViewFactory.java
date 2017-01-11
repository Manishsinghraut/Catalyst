package com.lucernex.qa.views.components;

import com.google.common.collect.ImmutableMap;
import com.lucernex.qa.views.admin.ManageScheduleTemplate.TaskDetailModalDialogView;

public class ModalDialogViewFactory {
    static final ImmutableMap<String, Class<?>> NAME_TO_CLASS = new ImmutableMap.Builder<String, Class<?>>()
        .put("Apply Schedule Template", ApplyScheduleTemplateModalDialogView.class)
        .put("Task Detail",             TaskDetailModalDialogView.class)
        .build();

    public static ModalDialogView createModalDialogView(String dialogTitle) throws IllegalAccessException, InstantiationException {
        Class<?> clazz = NAME_TO_CLASS.get(dialogTitle);

        if (clazz == null) {
            return null;
        } else {
            return (ModalDialogView)clazz.newInstance();
        }
    }
}
