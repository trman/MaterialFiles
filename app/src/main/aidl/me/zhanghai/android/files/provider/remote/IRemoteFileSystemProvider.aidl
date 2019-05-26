package me.zhanghai.android.files.provider.remote;

import me.zhanghai.android.files.provider.remote.ParcelableCopyOptions;
import me.zhanghai.android.files.provider.remote.ParcelableDirectoryStream;
import me.zhanghai.android.files.provider.remote.ParcelableException;
import me.zhanghai.android.files.provider.remote.ParcelableFileAttributes;
import me.zhanghai.android.files.provider.remote.ParcelableObject;
import me.zhanghai.android.files.provider.remote.ParcelableSerializable;
import me.zhanghai.android.files.util.RemoteCallback;

interface IRemoteFileSystemProvider {

    ParcelableDirectoryStream newDirectoryStream(in ParcelableObject parcelableDirectory,
            in ParcelableObject parcelableFilter, out ParcelableException exception);

    void createDirectory(in ParcelableObject parcelableDirectory,
            in ParcelableFileAttributes parcelableAttributes,
            out ParcelableException exception);

    void createSymbolicLink(in ParcelableObject parcelableLink,
            in ParcelableObject parcelableTarget, in ParcelableFileAttributes parcelableAttributes,
            out ParcelableException exception);

    void createLink(in ParcelableObject parcelableLink, in ParcelableObject parcelableExisting,
            out ParcelableException exception);

    void delete(in ParcelableObject parcelablePath, out ParcelableException exception);

    ParcelableObject readSymbolicLink(in ParcelableObject parcelableLink,
            out ParcelableException exception);

    RemoteCallback copy(in ParcelableObject parcelableSource, in ParcelableObject parcelableTarget,
            in ParcelableCopyOptions parcelableOptions, in RemoteCallback callback);

    RemoteCallback move(in ParcelableObject parcelableSource, in ParcelableObject parcelableTarget,
            in ParcelableCopyOptions parcelableOptions, in RemoteCallback callback);

    boolean isSameFile(in ParcelableObject parcelablePath, in ParcelableObject parcelablePath2,
            out ParcelableException exception);

    boolean isHidden(in ParcelableObject parcelablePath, out ParcelableException exception);

    ParcelableObject getFileStore(in ParcelableObject parcelablePath,
            out ParcelableException exception);

    void checkAccess(in ParcelableObject parcelablePath, in ParcelableSerializable parcelableModes,
            out ParcelableException exception);

    ParcelableObject readAttributes(in ParcelableObject parcelablePath,
            in ParcelableSerializable parcelableType, in ParcelableSerializable parcelableOptions,
            out ParcelableException exception);
}
