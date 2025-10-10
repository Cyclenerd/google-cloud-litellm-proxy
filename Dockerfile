# Copyright 2024-2025 Nils Knieling
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Use python:3.13-slim image for a minimal Python 3.13 environment
FROM python:3.13-slim

WORKDIR /app

# Log Python messages immediately instead of being buffered
ENV PYTHONUNBUFFERED="True"

# Default HTTP port
EXPOSE 8080/tcp

# Install LiteLLM proxy
COPY requirements.txt requirements.txt
COPY config.yaml config.yaml
RUN pip install -r requirements.txt && \
    pip cache purge

# Start
ENTRYPOINT ["litellm"]
CMD ["--port", "8080", "--config", "config.yaml"]
