#!/bin/sh
set -eu

IMAGES="
codimd
mysql
volumio
"

DOCKER_TAG="${DOCKER_TAG:-master}"

# Build images.
for image in $IMAGES; do
	echo "Building jbonjean/$image"
	docker build "$image" --tag "jbonjean/$image:$DOCKER_TAG" --build-arg DOCKER_TAG="$DOCKER_TAG"
	docker tag "jbonjean/$image:$DOCKER_TAG" "jbonjean/$image:latest"
done

echo "Build success"

if [ "${CI:-}" != "true" ]; then
	echo "Not in CI environment, stopping here"
	exit 0
fi

# Push images, with the new tag.
for image in $IMAGES; do
	echo "Pushing jbonjean/$image:$DOCKER_TAG"
	docker push "jbonjean/$image:$DOCKER_TAG"
done

# Update latest tag.
for image in $IMAGES; do
	echo "Pushing jbonjean/$image:latest"
	docker push "jbonjean/$image:latest"
done

echo "Done"
