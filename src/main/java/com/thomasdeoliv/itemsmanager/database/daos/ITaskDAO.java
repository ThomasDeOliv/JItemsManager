package com.thomasdeoliv.itemsmanager.database.daos;

import com.thomasdeoliv.itemsmanager.database.entities.implementations.Task;
import org.jetbrains.annotations.Nullable;

import java.util.List;

/**
 * Data access methods for Task entities, extending {@link IBaseDAO} with {@code <Task>}.
 */
public interface ITaskDAO extends IBaseDAO<Task> {

	/**
	 * Retrieves all tasks related to a project from the database.
	 *
	 * @param projectId the ID of the related project.
	 * @return a list of related tasks.
	 */
	List<Task> getAllTasks(Long projectId);

	/**
	 * Retrieves a task by its ID.
	 *
	 * @param id the ID of the task to retrieve.
	 * @return the task with the specified ID, or {@code null} if no such entity exists.
	 */
	@Nullable
	Task getTaskById(Long id);
}
